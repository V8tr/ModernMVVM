//
//  System.swift
//  ModernMVVM
//
//  Created by Vadym Bulavin on 3/13/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import Foundation
import Combine

typealias Feedback<State, Event> = (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never>

extension Publishers {
    static func system<State, Event, S: Scheduler>(
        initial: State,
        feedbacks: [Feedback<State, Event>],
        scheduler: S,
        reduce: @escaping (State, Event) -> State
    ) -> AnyPublisher<State, Never> {
        
        return Deferred { () -> AnyPublisher<State, Never> in
            let state = CurrentValueSubject<State, Never>(initial)
            
//            let events: AnyPublisher<Event, Never> = Publishers.MergeMany(
//                feedbacks.map { feedback in
//                    return feedback(state)
//                }
//            )
            
//            let events = feedbacks
//                .map { feedbacks in
//                    return feedbacks.events(state.eraseToAnyPublisher())
//            }
            
//            return Publishers.MergeMany(events)
//                .receive(on: scheduler)
//                .scan(initial, reduce)
//                .prepend(initial)
//                .handleEvents(receiveOutput: state.send)
//                .receive(on: scheduler)
//                .eraseToAnyPublisher()
            
            fatalError()
        }
        .eraseToAnyPublisher()
    }
}

//public static func system<State, Event>(
//    initialState: State,
//    reduce: @escaping (State, Event) -> State,
//    scheduler: ImmediateSchedulerType,
//    feedback: [Feedback<State, Event>]
//) -> Observable<State> {
//    return Observable<State>.deferred {
//        let replaySubject = ReplaySubject<State>.create(bufferSize: 1)
//
//        let asyncScheduler = scheduler.async
//
//        let events: Observable<Event> = Observable.merge(
//            feedback.map { feedback in
//                let state = ObservableSchedulerContext(source: replaySubject.asObservable(), scheduler: asyncScheduler)
//                return feedback(state)
//            }
//        )
//        // This is protection from accidental ignoring of scheduler so
//        // reentracy errors can be avoided
//        .observeOn(CurrentThreadScheduler.instance)
//
//        return events.scan(initialState, accumulator: reduce)
//            .do(
//                onNext: { output in
//                    replaySubject.onNext(output)
//                }, onSubscribed: {
//                    replaySubject.onNext(initialState)
//                }
//            )
//            .subscribeOn(scheduler)
//            .startWith(initialState)
//            .observeOn(scheduler)
//    }
//}

